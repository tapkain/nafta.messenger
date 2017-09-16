using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Nafta.Messenger.Api.Repository;
using Nafta.Messenger.Api.Repository.Models;

namespace Nafta.Messenger.Api.Controllers
{
    [Route("api/[controller]")]
    public class MessageController : Controller
    {
        private DataContext _dataContext { get; set; }

        public MessageController(DataContext dataContext)
        {
            _dataContext = dataContext;
        }

        [HttpGet]
        public IEnumerable<Message> Get()
        {
            return _dataContext.Messages.ToList();
        }

        [HttpGet("{id}")]
        public Message Get(int id)
        {
            return _dataContext.Messages.Where(m => m.MessageId == id).FirstOrDefault();
        }

        [HttpPost]
        public void Post([FromBody]Message message)
        {
            if (message == null)
            {
                return;
            }

            _dataContext.Messages.Add(message);
            _dataContext.SaveChanges();
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            var message = _dataContext.Messages.Where(m => m.MessageId == id).First();
            _dataContext.Messages.Remove(message);
            _dataContext.SaveChanges();
        }
    }
}

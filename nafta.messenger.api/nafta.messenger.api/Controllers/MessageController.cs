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
        public Message Get(int user_id, int timestamp)
        {
            return _dataContext.Messages
                               .Where(m => m.UserReceiverId == user_id)
                               .Where(m => m.SendTimestamp >= timestamp)
                               .FirstOrDefault();
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
    }
}

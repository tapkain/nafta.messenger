using System;

namespace Nafta.Messenger.Api.Repository.Models
{
    public class Message
    {
        public int MessageId { get; set; }
        public string TextContent { get; set; }
        public DateTime SendDate { get; set; }
    }
}

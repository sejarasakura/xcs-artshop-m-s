using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public class CategoryCopy
    {
        public CategoryCopy(Category category)
        {
            this.id = category.id;
            this.name = category.name;
            this.description = category.description;
            this.color = category.color;
            this.enable = category.enable;
            this.permission_level = category.permission_level;
        }

        public CategoryCopy(int id, string name, string description, string color, bool enable, int permission_level)
        {
            this.id = id;
            this.name = name;
            this.description = description;
            this.color = color;
            this.enable = enable;
            this.permission_level = permission_level;
        }

        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string color { get; set; }
        public bool enable { get; set; }
        public int permission_level { get; set; }
    }
}
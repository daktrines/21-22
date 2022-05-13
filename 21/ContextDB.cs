using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _21
{
    public static class ContextDB
    {
        public static int ID;//Код записи
        static Pr21Entities context;
        public static Pr21Entities GetContext()
        {
            if (context == null) context = new Pr21Entities();
            return context;
        }
    }
}

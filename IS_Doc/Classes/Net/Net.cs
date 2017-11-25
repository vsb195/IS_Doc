using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IS_Doc.Classes.Net
{
    /// <summary>
    /// Класс реализующий работу с сервером
    /// </summary>
    public class Net
    {
        private static Net instance;

        private Net() { }

        public static Net GetInstance()
        {
            if (instance == null)
                instance = new Net();
            return instance;
        }



    }
}

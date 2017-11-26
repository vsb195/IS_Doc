using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using IS_Doc_Server.Classes.Log;

namespace IS_Doc.Classes.Net
{
    /// <summary>
    /// Класс реализующий работу с сервером
    /// </summary>
    public class Net : IDisposable
    {
        #region Fields

        private static Net instance;

        const int port = 8888;
        const string address = "127.0.0.1";
        TcpClient client = null;
        private NetworkStream stream = null;

        private bool _disposing = false;
        private bool _isConnected = false;
        #endregion

        #region Properties

        public bool IsConnected
        {
            get { return _isConnected; }
        }

        #endregion
        private Net()
        {
            Connect();
        }

        public static Net GetInstance()
        {
            if (instance == null)
                instance = new Net();
            return instance;
        }

        private void Connect()
        {
            try
            {
                client = new TcpClient(address, port);
                stream = client.GetStream();
                _isConnected = true;
            }
            catch (Exception ex)
            {
                Logger.FatalException(ex);
            }
        }

        /// <summary>
        /// Отправка сообщений на сервер в свободном формате
        /// </summary>
        /// <param name="command">Команда в свободном формате</param>
        /// <returns>Ответ от сервера</returns>
        public string Send(string command)
        {
            if (!_isConnected)
            {
                throw new Exception("Подключение не установлено");
            }

            while (true)
            {
                Logger.Debug("Send: " + command);

                // преобразуем сообщение в массив байтов
                byte[] data = Encoding.Unicode.GetBytes(command);
                // отправка сообщения
                stream.Write(data, 0, data.Length);

                // получаем ответ
                data = new byte[64]; // буфер для получаемых данных
                StringBuilder builder = new StringBuilder();
                int bytes = 0;
                do
                {
                    bytes = stream.Read(data, 0, data.Length);
                    builder.Append(Encoding.Unicode.GetString(data, 0, bytes));
                }
                while (stream.DataAvailable);

                string answer = builder.ToString();
                Logger.Debug("Answer: " + command);
                return answer;
            }
        }

        public void Close()
        {
            if (client != null)
                client.Close();
        }


        protected virtual void Dispose(bool disposing)
        {
            if (!_disposing)
            {
                if (disposing)
                {
                    //dispose managed resources
                    if (client != null)
                        client.Close();
                }
            }
            //dispose unmanaged resources
            _disposing = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}

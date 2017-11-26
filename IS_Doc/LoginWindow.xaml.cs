using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using IS_Doc.Classes.Net;
using IS_Doc_Server.Classes.Log;

namespace IS_Doc
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
            if (!Net.GetInstance().IsConnected)
            {
                MessagePanel.Visibility = Visibility.Visible;
                labelMessage.Content = "Невозможно подключиться к серверу\nПроверьте соединение с интернетом";
                //
                tbLogin.IsEnabled = false;
                pbPassword.IsEnabled = false;
                bLogin.IsEnabled = false;
            }
            else
            {
                MessagePanel.Visibility = Visibility.Hidden;
#if DEBUG
                MessageBox.Show(Net.GetInstance().Send("TraTeTa"));
#endif
            }
        }

        private void bLogin_Click(object sender, RoutedEventArgs e)
        {
            string login = tbLogin.Text;
            string pass = pbPassword.Password;

            try
            {
                var answer = Net.GetInstance().Send("login: " + login + "  password: " + pass);

                MessageBox.Show(answer);
            }
            catch (Exception ex)
            {
                Logger.FatalException(ex);
            }
        }
    }
}

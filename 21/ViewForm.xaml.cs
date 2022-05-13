using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace _21
{
    /// <summary>
    /// Логика взаимодействия для ViewForm.xaml
    /// </summary>
    public partial class ViewForm : Window
    {
        public ViewForm()
        {
            InitializeComponent();
        }


        Pr21Entities db = ContextDB.GetContext();

        private void Find_Click(object sender, RoutedEventArgs e)
        {
            if(sql1.IsChecked == true)
            {
                Viewtable.ItemsSource = db.Задание1();
            }
            if (sql2.IsChecked == true)
            {
                try
                {
                    Viewtable.ItemsSource = db.Задание2(Convert.ToInt32(ID.Text));
                }
                catch
                {
                    MessageBox.Show("Введите параметр!", "Ошибка", MessageBoxButton.OK,
                      MessageBoxImage.Error);
                }
            }
            if (sql2_2.IsChecked == true)
            {
                try
                {
                    //Viewtable.ItemsSource = db.Задание2_2(Convert.ToInt32(Number.Text), Convert.ToInt32(ID.Text));
                }
                catch
                {
                    MessageBox.Show("Введите параметр!", "Ошибка", MessageBoxButton.OK,
                      MessageBoxImage.Error);
                }
            }
            if (sql3.IsChecked == true)
            {
                Viewtable.ItemsSource = db.Задание3();
            }
            if (sql4.IsChecked == true)
            {
                try
                {
                    Viewtable.ItemsSource = db.Задание4(Convert.ToInt32(ID.Text));
                }
                catch
                {
                    MessageBox.Show("Введите параметр!", "Ошибка", MessageBoxButton.OK,
                      MessageBoxImage.Error);
                }
            }
            if (sql5.IsChecked == true)
            {
                Viewtable.ItemsSource = db.Задание5();
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.DirectoryOfEmployees.Load();
            db.ListOfFactories.Load();
            db.TariffReferences.Load();
            db.ReportCards.Load();
        }
    }
}

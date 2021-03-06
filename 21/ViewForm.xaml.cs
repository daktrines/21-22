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
                    if (Convert.ToInt32(ID.Text) > 0)
                        Viewtable.ItemsSource = db.Задание2(Convert.ToInt32(ID.Text));
                    else throw new Exception(); 
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
                    if (Convert.ToInt32(ID.Text) > 0)
                    {
                        db.Задание2_2(Convert.ToInt32(Number.Text), Convert.ToInt32(ID.Text));
                        db.SaveChanges();
                    }
                    else throw new Exception();

                }
                catch
                {
                MessageBox.Show("Введите параметр!", "Ошибка", MessageBoxButton.OK,
                  MessageBoxImage.Error);
                }
            }
            if (sql3.IsChecked == true)
            {
                Viewtable.ItemsSource = db.Задание3Измененное();
            }
            if (sql4.IsChecked == true)
            {
                try
                {
                    if (Convert.ToInt32(ID.Text) > 0)
                        Viewtable.ItemsSource = db.Задание4(Convert.ToInt32(ID.Text));
                    else throw new Exception();
                }
                catch
                {
                    MessageBox.Show("Введите параметр!", "Ошибка", MessageBoxButton.OK,
                      MessageBoxImage.Error);
                }
            }
            if (sql5.IsChecked == true)
            {
                Viewtable.ItemsSource = db.Задание5_();
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.DirectoryOfEmployees.Load();
            db.ListOfFactories.Load();
            db.TariffReferences.Load();
            db.ReportCards.Load();
        }

        private void Viewtable_AutoGeneratedColumns(object sender, EventArgs e)
        {
            int count = Viewtable.Columns.Count;
            if (count != 0)
            {
                for (int i = 0; i < count; i++)
                {
                    if (Viewtable.Columns[i].Header.ToString() == "FactoryName")
                    {
                        Viewtable.Columns[i].Header = "Наименование цеха";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "Surname")
                    {
                        Viewtable.Columns[i].Header = "Фамилия";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "Discharge")
                    {
                        Viewtable.Columns[i].Header = "Разряд";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "Rate")
                    {
                        Viewtable.Columns[i].Header = "Тариф";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "КолвоСотрудников")
                    {
                        Viewtable.Columns[i].Header = "Количество работников";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "ServiceNumber")
                    {
                        Viewtable.Columns[i].Header = "Табельный номер";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "MonthNumber")
                    {
                        Viewtable.Columns[i].Header = "Номер месяца";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "Exp1")
                    {
                        Viewtable.Columns[i].Header = "Начислено";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "FactoryNumber")
                    {
                        Viewtable.Columns[i].Header = "Цех";
                    }
                    if (Viewtable.Columns[i].Header.ToString() == "Expr1")
                    {
                        Viewtable.Columns[i].Header = "Средняя зарплата по цеху";
                    }
                }
            }
        }
    }
}

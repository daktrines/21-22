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
    /// Логика взаимодействия для Tariff.xaml
    /// </summary>
    public partial class Factory : Window
    {
        public Factory()
        {
            InitializeComponent();
        }
        Pr21Entities db = ContextDB.GetContext();

        private void AddFactory_Click(object sender, RoutedEventArgs e)
        {
            //Проверка каждого обязательного для заполнения поля
            StringBuilder errors = new StringBuilder();
            if (FactoryNumber.Text.Length == 0 || double.TryParse(FactoryNumber.Text, out double x1) == false) errors.AppendLine("Введите код цеха");
            if (FactoryName.Text.Length == 0) errors.AppendLine("Введите наименование цеха");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            //Создаем элемент таблицы
            ListOfFactory p1 = new ListOfFactory();
            //Заполняем этот элемент
            p1.FactoryNumber = Convert.ToInt32(FactoryNumber.Text);
            p1.FactoryName = FactoryName.Text;
           
            try
            {
                //Добавляем в БД
                db.ListOfFactories.Add(p1);
                //Сохраняем изменения
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void DeleteFactory_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = Factorytable.SelectedIndex;
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?", "Удаление записи",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    //Получаем текущую запись
                    ListOfFactory row1 = (ListOfFactory)Factorytable.Items[indexRow];
                    //Удаляем запись
                    db.ListOfFactories.Remove(row1);
                    db.SaveChanges();
                }
                catch (ArgumentOutOfRangeException)
                {
                    MessageBox.Show("Выберите запись");
                }
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //Загружаем таблицу из БД
            db.ListOfFactories.Load();
            //Загружаем таблицу в DataGrid с отслеживанием изменения контекста 
            Factorytable.ItemsSource = db.ListOfFactories.Local.ToBindingList();
        }
    }
}

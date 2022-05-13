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
    public partial class Tariff : Window
    {
        public Tariff()
        {
            InitializeComponent();
        }
        Pr21Entities db = ContextDB.GetContext();

        private void AddTariff_Click(object sender, RoutedEventArgs e)
        {
            //Проверка каждого обязательного для заполнения поля
            StringBuilder errors = new StringBuilder();
            if (Discharge.Text.Length == 0 || double.TryParse(Discharge.Text, out double x1) == false) errors.AppendLine("Введите разряд");
            if (Rate.Text.Length == 0 || double.TryParse(Rate.Text, out double x2) == false) errors.AppendLine("Введите тарифф");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            //Создаем элемент таблицы
            TariffReference p1 = new TariffReference();
            //Заполняем этот элемент
            p1.Discharge = Convert.ToInt32(Discharge.Text);
            p1.Rate = Convert.ToInt32(Rate.Text);
           
            try
            {
                //Добавляем в БД
                db.TariffReferences.Add(p1);
                //Сохраняем изменения
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void DeleteTariff_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = Tarifftable.SelectedIndex;
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?", "Удаление записи",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    //Получаем текущую запись
                    TariffReference row = (TariffReference)Tarifftable.Items[indexRow];
                    //Удаляем запись
                    db.TariffReferences.Remove(row);
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
            db.TariffReferences.Load();
            //Загружаем таблицу в DataGrid с отслеживанием изменения контекста 
            Tarifftable.ItemsSource = db.TariffReferences.Local.ToBindingList();
        }
    }
}

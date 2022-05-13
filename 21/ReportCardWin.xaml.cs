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
    public partial class ReportCardWin : Window
    {
        public ReportCardWin()
        {
            InitializeComponent();
        }
        Pr21Entities db = ContextDB.GetContext();

        private void AddReportCard_Click(object sender, RoutedEventArgs e)
        {
            //Проверка каждого обязательного для заполнения поля
            StringBuilder errors = new StringBuilder();
            if (ServiceNumberCB.Text.Length == 0 || double.TryParse(ServiceNumberCB.Text, out double x1) == false) errors.AppendLine("Введите тебельный номер");
            if (TimeWorkedInHours.Text.Length == 0 || double.TryParse(TimeWorkedInHours.Text, out double x2) == false) errors.AppendLine("Введите отработанное время в часах");
            if (MonthNumber.Text.Length == 0 || double.TryParse(MonthNumber.Text, out double x3) == false) errors.AppendLine("Введите кол-во отработанных месяцев");
            if (Year.Text.Length == 0 || double.TryParse(Year.Text, out double x4) == false) errors.AppendLine("Введите год");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            //Создаем элемент таблицы
            ReportCard p1 = new ReportCard();
            //Заполняем этот элемент
            p1.ServiceNumber = Convert.ToInt32(ServiceNumberCB.Text);
            p1.TimeWorkedInHours = Convert.ToInt32(TimeWorkedInHours.Text);
            p1.MonthNumber = Convert.ToInt32(MonthNumber.Text);
            p1.Year = Convert.ToInt32(Year.Text);

            try
            {
                //Добавляем в БД
                db.ReportCards.Add(p1);
                //Сохраняем изменения
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void DeleteReportCard_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = ReportCardtable.SelectedIndex;
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?", "Удаление записи",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    //Получаем текущую запись
                    //Factory row = (Factory)DataGrid1.SelectedItems[0];
                    ReportCard row2 = (ReportCard)ReportCardtable.Items[indexRow];
                    //Factory row = (Factory)DataGrid1.CurrentCell.Item;
                    //Удаляем запись
                    db.ReportCards.Remove(row2);
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
            db.ReportCards.Load();
            //Загружаем таблицу в DataGrid без отслеживания изменений контекста 
            //DataGrid1.ItemsSource = db.Factories.ToList();
            //Загружаем таблицу в DataGrid с отслеживанием изменения контекста 
            ReportCardtable.ItemsSource = db.ReportCards.Local.ToBindingList();
            ServiceNumberCB.ItemsSource = db.DirectoryOfEmployees.Local.ToBindingList();
        }
    }
}

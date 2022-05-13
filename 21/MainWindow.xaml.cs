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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace _21
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Update_Click(object sender, RoutedEventArgs e)
        {
            //Обновляем таблицу
            db.DirectoryOfEmployees.Load();
            db.TariffReferences.Load();
            DataGrid1.ItemsSource = db.ГлавнаяФорма();
        }

        private void Information_Click(object sender, RoutedEventArgs e)
        {

            MessageBox.Show("Калион Екатерина " +
               "\n21 пр" +
               "\nВариант 1." +
               "\nЗадание 1.Создать таблицы: " +
               "\nТаблица 1.Справочник работников. Структура таблицы: Табельный номер, Фамилия, Разряд, Цех" +
               "\nТаблица 2.Справочник тарифов. Структура таблицы: Разряд, Тариф(руб./ час.)" +
               "\nТаблица 3.Табель. Структура таблицы: Табельный номер, Отработанное время в часах, Номер месяца" +
               "\nТаблица 4.Список цехов. Структура таблицы: Цех, Наименование цеха." +
               "\nЗадание 2.С помощью SQL - запроса сформировать список работников цеха.Список" +
               "должен содержать поля: Наименование цеха, Фамилия, Разряд, Тариф." +
               "\nЗадание 3.Создать SQL - запрос для подсчета количества работников, работающих в" +
               "одном цехе, который должен содержать поля: Цех, Количество работников. " +
               "\n22 пр" +
               "\nЗадание 1. Составить SQL-запрос на добавление записей в таблицу Цех." +
               "\nЗадание2.Составить SQL - запрос на перевод работника, имеющего заданный табельный" +
               "номер в другой цех." +
               "\nЗадание 3.С помощью SQL - запроса сформировать ведомость начислений зарплаты и" +
               "упорядочить ее по фамилии.Ведомость должна содержать поля: Табельный номер," +
               "Фамилия, Номер месяца, Начислено." +
               "\nЗадание 4.Составить SQL - запрос для получения справки о средней зарплате" +
               "сотрудников, работающих в одном цехе.В справку выводить Наименование цеха, Средняя" +
               "зарплата по цеху." +
               "\nЗадание 5.С помощью SQL - запроса вывести фамилии сотрудников, оклад которых выше" +
               "среднего оклада по предприятию. ", "Информация", MessageBoxButton.OK, MessageBoxImage.Question);

        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
        Pr21Entities db = ContextDB.GetContext();
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //Загружаем таблицу из БД
            db.DirectoryOfEmployees.Load();
            db.TariffReferences.Load();
            //Загружаем таблицу в DataGrid без отслеживания изменений контекста 
            //DataGrid1.ItemsSource = db.Factories.ToList();
            //Загружаем таблицу в DataGrid с отслеживанием изменения контекста 
            DataGrid1.ItemsSource = db.ГлавнаяФорма();
            
        }

        private void Tariff_Click(object sender, RoutedEventArgs e)
        {
            Tariff tariff = new Tariff();
            tariff.Show();
        }

        private void Factory_Click(object sender, RoutedEventArgs e)
        {
            Factory factory = new Factory();
            factory.Show();
        }

        private void ReportCard_Click(object sender, RoutedEventArgs e)
        {
            ReportCardWin card = new ReportCardWin();
            card.Show();
        }

        private void Find_Click(object sender, RoutedEventArgs e)
        {
            FindWin find = new FindWin();
            if(find.ShowDialog() ==true) DataGrid1.ItemsSource = find.q;
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            //DataGrid1 .ItemsSource = новыйРаботник
            AddForm add = new AddForm();
            add.Show();
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = DataGrid1.SelectedIndex;
            if (indexRow != -1)
            {
                //Получаем ключ текущей записи
                DirectoryOfEmployee d = db.DirectoryOfEmployees.Local.ElementAt(indexRow);
                //Открываем форму Редактировать
                EditForm edit = new EditForm(d);
                edit.ShowDialog();
                //Обновляем таблицу
                DataGrid1.Items.Refresh();
                DataGrid1.Focus();
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = DataGrid1.SelectedIndex;
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?", "Удаление записи",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    //Получаем текущую запись
                    DirectoryOfEmployee d = db.DirectoryOfEmployees.Local.ElementAt(indexRow);
                    //Удаляем запись
                    db.DirectoryOfEmployees.Remove(d);
                    db.SaveChanges();
                    //Обновляем таблицу
                    DataGrid1.Items.Refresh();
                }
                catch (ArgumentOutOfRangeException)
                {
                    MessageBox.Show("Выберите запись");
                }
            }
        }

        private void View_Click(object sender, RoutedEventArgs e)
        {
            ViewForm view = new ViewForm();
            view.Show();
        }
    }
}

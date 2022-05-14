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
    /// Логика взаимодействия для AddForm.xaml
    /// </summary>
    public partial class AddForm : Window
    {
        public AddForm()
        {
            InitializeComponent();
            ServiceNumber.Focus();
        }

        Pr21Entities db = ContextDB.GetContext();

        private void AddMain_Click(object sender, RoutedEventArgs e)
        {
            //Проверка каждого обязательного для заполнения поля
            StringBuilder errors = new StringBuilder();
            if (ServiceNumber.Text.Length == 0 || double.TryParse(ServiceNumber.Text, out double x1) == false || x1 <1 ) errors.AppendLine("Введите табельный номер");
            if (Surname.Text.Length == 0) errors.AppendLine("Введите фамилию");
            if (Discharge.Text.Length == 0 || double.TryParse(Discharge.Text, out double x2) == false) errors.AppendLine("Введите разряд");
            if (Factory.Text.Length == 0 ) errors.AppendLine("Введите цех");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            try
            {
                db.НовыйРаботник(Convert.ToInt32(ServiceNumber.Text), Surname.Text, Convert.ToInt32(Discharge.Text), ((ListOfFactory)Factory.SelectedValue).FactoryNumber);
                //Сохраняем изменения
                db.SaveChanges();
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
            
        }

        private void CloseMain_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.ListOfFactories.Load();
            db.TariffReferences.Load();
            //Поличаем список из другой таблицы
            Discharge.ItemsSource = db.TariffReferences.Local.ToBindingList();
            Factory.ItemsSource = db.ListOfFactories.Local.ToBindingList();
        }

        //Получаем в комбобокс значения
        private void Discharge_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                //получаем список разрядов из таблицы тарифов, и потом используем выборку по разряду
                AddTable.ItemsSource = db.TariffReferences.Local.ToBindingList().Where(p => p.Discharge == ((TariffReference)Discharge.SelectedValue).Discharge);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}

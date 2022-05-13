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
    public partial class EditForm : Window
    {
        public EditForm(DirectoryOfEmployee d1)
        {

            InitializeComponent();
            p1 = d1;
        }

        Pr21Entities db = ContextDB.GetContext();
        DirectoryOfEmployee p1;//Элемент для работы с записью

        private void EditMain_Click(object sender, RoutedEventArgs e)
        {
            //Проверка каждого обязательного для заполнения поля
            StringBuilder errors = new StringBuilder();
            if (Surname.Text.Length == 0) errors.AppendLine("Введите фамилию");
            if (Discharge.Text.Length == 0 || double.TryParse(Discharge.Text, out double x2) == false) errors.AppendLine("Введите разряд");
           
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            //Заполняем этот элемент
            p1.Surname = Surname.Text;
            p1.Discharge = ((TariffReference)Discharge.SelectedValue).Discharge;
            p1.Factory = ((ListOfFactory)Factory.SelectedValue).FactoryNumber;

            try
            {
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

            //Отображаем запись
            ServiceNumber.Text = Convert.ToString(p1.ServiceNumber);
            Surname.Text = p1.Surname;
            Discharge.SelectedValue = Discharge.Items[p1.Discharge - 1];
            Factory.SelectedValue = Factory.Items[p1.Factory - 1];
        }

        //получаем в комбобокс значения
        private void Discharge_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                EditTable.ItemsSource = db.TariffReferences.Local.ToBindingList().Where(p => p.Discharge == ((TariffReference)Discharge.SelectedValue).Discharge);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}

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

namespace _21
{
    /// <summary>
    /// Логика взаимодействия для FindWin.xaml
    /// </summary>
    public partial class FindWin : Window
    {
        Pr21Entities db = ContextDB.GetContext();
        public IEnumerable<ГлавнаяФорма_Result> q;
        public FindWin()
        {
            InitializeComponent();
        }
        private void FindForm_Click(object sender, RoutedEventArgs e)
        {
            //Получаем поиск записи
            q = db.ГлавнаяФорма().ToList().Where(p => p.Surname == Find.Text);
            DialogResult = true;
            Close();
        }
    }
}

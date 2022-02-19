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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfVosmerkaApp.Context;
using WpfVosmerkaApp.Model;

namespace WpfVosmerkaApp.Views.Pages.AdminPages.Managers
{
    /// <summary>
    /// Логика взаимодействия для ManagerActionPage.xaml
    /// </summary>
    public partial class ManagerActionPage : Page
    {
        public List<Role> Roles { get; set; }
        public Manager Manager { get; set; }
        public ManagerActionPage(Manager manager)
        {
            InitializeComponent();
            Roles = DataApp.vb.Role.ToList();
            Manager = manager;
            this.DataContext = this;
        }

        private void ManagerDataSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(TextBoxFirstName.Text) && string.IsNullOrEmpty(TextBoxLastName.Text) &&
                string.IsNullOrEmpty(TextBoxPhone.Text) &&
                string.IsNullOrEmpty(TextBoxPhone.Text)) throw new Exception("Пожалуйста ,заполните все поля!");

                if (Manager.ID == 0)
                {
                    DataApp.vb.Manager.Add(Manager);
                }
                DataApp.vb.SaveChanges();
                MessageBox.Show("Данные успешно добавлены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
                GC.Collect();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Неизвестная Ошибка!", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}

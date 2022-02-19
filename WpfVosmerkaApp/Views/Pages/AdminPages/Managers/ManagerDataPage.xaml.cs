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
    /// Логика взаимодействия для ManagerDataPage.xaml
    /// </summary>
    public partial class ManagerDataPage : Page
    {
        public static Role Role { get; set; }
        public static Manager Manager { get; set; }
        public ManagerDataPage(Manager manager)
        {
            InitializeComponent();
            Manager = manager;
            this.DataContext = this;
        }

        private void AddManagerBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ManagerActionPage(new Manager()));
        }

        private void EditManagerBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var selectedItemManager = ManagerData.SelectedItem as Manager;
                if (selectedItemManager != null)
                    NavigationService.Navigate(new ManagerActionPage(selectedItemManager));
                else
                    throw new Exception("Пожалуйста, выберите объект из списка!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void DeleteManagerBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedItemManager = ManagerData.SelectedItem as Manager;
            if (selectedItemManager != null)
            {
                if (MessageBox.Show("Вы дествительно хотите удалить данные?", "Данные будут удалены навсегда!", MessageBoxButton.OKCancel, MessageBoxImage.Warning) == MessageBoxResult.OK)
                {
                    DataApp.vb.Manager.Remove(selectedItemManager);
                    DataApp.vb.SaveChanges();
                    MessageBox.Show("Данные успешно удалены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                    Page_Loaded(null, null);
                }

            }
            else
                throw new Exception("Пожалуйста, выберите объект из списка!");
        }

        private void ManagerSearchTxb_SelectionChanged(object sender, RoutedEventArgs e)
        {
            var list = DataApp.vb.Manager.Where(item => item.FirstName.Contains(ManagerSearchTxb.Text) ||
           item.LastName.Contains(ManagerSearchTxb.Text) || item.Phone.Contains(ManagerSearchTxb.Text)
           || item.Adress.Contains(ManagerSearchTxb.Text)).ToList();

            if (list.Any())
            {
                ManagerData.Visibility = Visibility.Visible;
                NoManager.Visibility = Visibility.Collapsed;
                ManagerData.ItemsSource = list;
            }
            else
            {
                ManagerData.Visibility = Visibility.Collapsed;
                NoManager.Visibility = Visibility.Visible;
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            ManagerData.ItemsSource = DataApp.vb.Manager.ToList();
        }
    }
}

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
using WpfVosmerkaApp.Views.Pages.ManagerPages.Materials;
using WpfVosmerkaApp.Views.Pages.ManagerPages.Products;

namespace WpfVosmerkaApp.Views.Pages.ManagerPages
{
    /// <summary>
    /// Логика взаимодействия для ManagerMainPage.xaml
    /// </summary>
    public partial class ManagerMainPage : Page
    {
        public ManagerMainPage()
        {
            InitializeComponent();
        }

        private void MaterialDataBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MaterialsDataPage());
        }

        private void ProductBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductDataPage(new Model.Product()));
        }

        private void AgentsListBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void OrdersBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

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

namespace WpfVosmerkaApp.Views.Pages.ManagerPages.Products
{
    /// <summary>
    /// Логика взаимодействия для ProductDataPage.xaml
    /// </summary>
    public partial class ProductDataPage : Page
    {
        public ProductType  ProductType { get; set; }
        public List<Product> Products { get; set; }
        public Product Product { get; set; }
        public ProductDataPage(Product product)
        {
            InitializeComponent();
            Product = product;
            this.DataContext = this;

        }

        private void ProductSearchTxb_SelectionChanged(object sender, RoutedEventArgs e)
        {
            var data = DataApp.vb.Product.Where(item => item.Title.Contains(ProductSearchTxb.Text)
            || item.Cost.ToString().Contains(ProductSearchTxb.Text)).ToList();
            if (data.Any())
            {
                ProductListView.Visibility = Visibility.Visible;
                NoProduct.Visibility = Visibility.Collapsed;
                ProductListView.ItemsSource = data;
            }
            else
            {
                ProductListView.Visibility = Visibility.Collapsed;
                NoProduct.Visibility = Visibility.Visible;
            }
        }

        private void ProductTypeCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SearchType((ProductTypeCmb.SelectedItem as ComboBoxItem).Content.ToString(), ProductTypeCmb.Text);
        }

        private void SearchType(string type = "", string search = "")
        {
            var products = DataApp.vb.Product.ToList();
            if (!string.IsNullOrEmpty(type) && !string.IsNullOrEmpty(type))
            {
                if (type == "Колесо")
                {
                    products = products.Where(item => item.ProductType.Title == "Колесо").ToList();
                }
                if (type == "Запаска")
                {
                    products = products.Where(item => item.ProductType.Title == "Запаска").ToList();
                }
                if (type == "Шина")
                {
                    products = products.Where(item => item.ProductType.Title == "Шина").ToList();
                }
                if (type == "Диск")
                {
                    products = products.Where(item => item.ProductType.Title == "Диск").ToList();
                }
                if (type == "Все")
                {
                    products = products.ToList();
                }
            }
            ProductListView.ItemsSource = products;
        }

        private void ProductBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ProductAddBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductActionPage(new Model.Product()));
        }

        private void ProductEditBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var selectedProduct = ProductListView.SelectedItem as Product;
                if (selectedProduct != null)
                    NavigationService.Navigate(new ProductActionPage(selectedProduct));
                else
                    throw new Exception("Пожалуйста, выберите объект из списка!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void ProductDeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedProduct = ProductListView.SelectedItem as Product;
            if (selectedProduct != null)
            {
                if (MessageBox.Show("Вы дествительно хотите удалить данные?", "Данные будут удалены навсегда!", MessageBoxButton.OKCancel, MessageBoxImage.Warning) == MessageBoxResult.OK)
                {
                    DataApp.vb.Product.Remove(selectedProduct);
                    DataApp.vb.SaveChanges();
                }
                MessageBox.Show("Данные успешно удалены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                Page_Loaded(null, null);

            }
            else
                throw new Exception("Пожалуйста, выберите объект из списка!");
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Products = DataApp.vb.Product.ToList();
            ProductListView.ItemsSource = Products;
        }
    }
}

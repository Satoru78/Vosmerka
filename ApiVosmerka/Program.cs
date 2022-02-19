using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Buffers;
using System.Text.Json;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using System.Net;
using ApiVosmerka.Context;
using ApiVosmerka.Model;
using System.IO;

namespace ApiVosmerka
{
    class Program
    {
        static void Main()
        {
            HttpListener server = new HttpListener();
            server.Prefixes.Add("http://localhost:23456/");

            JsonSerializerOptions options = new JsonSerializerOptions() { Encoder = JavaScriptEncoder.Create(UnicodeRanges.All) };
            server.Start();
            while (true)
            {
                HttpListenerContext context = server.GetContext();
                if(context.Request.HttpMethod == "GET")
                {
                    try
                    {
                        if (context.Request.RawUrl == "/api/product")
                        {
                            var bikeList = Data.vb.Product.ToList();
                            string response = JsonSerializer.Serialize(Data.vb.Product.ToList().ConvertAll(b => new ResponseProduct(b)), options);
                            byte[] data = Encoding.UTF8.GetBytes(response);
                            context.Response.ContentType = "application/json;charset=utf-8";
                            using (Stream stream = context.Response.OutputStream)
                            {
                                context.Response.StatusCode = 200;
                                stream.Write(data, 0, data.Length);
                            }
                        }
                        else
                            throw new Exception();
                    }
                    catch
                    {
                        context.Response.StatusCode = 400;
                        context.Response.Close();
                    }
                }
                else if(context.Request.HttpMethod =="POST")
                {
                    try
                    {
                        if (context.Request.RawUrl == "/api/product")
                        {
                            if (context.Request.ContentType == "application/json")
                            {
                                string request = "";
                                byte[] data = new byte[context.Request.ContentLength64];
                                using (Stream stream = context.Request.InputStream)
                                {
                                    stream.Read(data, 0, data.Length);
                                }
                                request = System.Text.UTF8Encoding.UTF8.GetString(data);
                                var productList = JsonSerializer.Deserialize<List<ResponseProduct>>(request);
                                foreach (var product in productList)
                                {
                                    Product products = new Product();
                                    products.ID = product.ID;
                                    products.Title = product.Title;
                                    products.Articul = product.Articul;
                                    product.Cost = product.Cost;
                                    products.Picture = product.Picture;
                                    products.IDProductType = product.IDProductType;
                                    products.CountOfPerson = product.CountOfPerson;
                                    products.WorkshopNumber = product.WorkshopNumber;
                                    Data.vb.Product.Add(products);
                                }
                                Data.vb.SaveChanges();
                                context.Response.StatusCode = 200;
                                context.Response.Close();

                            }
                            else
                                throw new Exception();
                        }
                        else
                            throw new Exception();
                    }
                    catch
                    {
                        context.Response.StatusCode = 400;
                        context.Response.Close();
                    }
                }
                else
                {
                   try
                   {
                        if (context.Request.HttpMethod == "DELETE")
                        {
                            if (context.Request.QueryString.Count == 1)
                            {
                                if (context.Request.QueryString.Keys[0] == "id")
                                {
                                    int id = Convert.ToInt32(context.Request.QueryString.Get(0));
                                    var currentProduct = Data.vb.Product.FirstOrDefault(b => b.ID == id);
                                    if (currentProduct != null)
                                    {
                                        Data.vb.Product.Remove(currentProduct);
                                        Data.vb.SaveChanges();
                                        context.Response.StatusCode = (int)HttpStatusCode.OK;
                                        context.Response.Close();
                                    }
                                    else
                                        throw new Exception();
                                }
                                else
                                    throw new Exception();
                            }
                            else
                                throw new Exception();
                        }
                        else
                            throw new Exception();
                   }
                    catch
                   {
                        context.Response.StatusCode = 400;
                        context.Response.Close();
                   }
                }
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLprogect
{
    class Program
    {
        static void Main(string[] args)
        {

            string command = @"SELECT ProductSet.Name, CategorySet.Name
                               FROM ProductSet
                               INNER JOIN CategoryProduct ON ProductSet.Id = CategoryProduct.Product_Id 
                               LEFT JOIN CategorySet ON CategoryProduct.Category_Id = CategorySet.Id";
            string constr = @"data source=(LocalDB)\MSSQLLocalDB;Database = Products; integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot";
            using (SqlConnection connection = new SqlConnection(constr))
            {
                
                connection.Open();
                SqlCommand cmd4 = connection.CreateCommand();
                cmd4.CommandText = command;
                SqlDataReader reader = cmd4.ExecuteReader();
               
                while (reader.Read())
                {

                    Console.WriteLine(reader[0].ToString() + " " + reader[1].ToString());
                }
                reader.Close();
            }
            Console.ReadLine();
        }
    }
}

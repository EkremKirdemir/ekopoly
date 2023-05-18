using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace proje_1
{
    public partial class Form1 : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection("server=localHost; port=5432; Database=Oyun; user Id=postgres;" +
            "password=14441903 ");
        public Form1()
        {
            InitializeComponent();
            this.Resize += Form1_Resize;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            connection.Open();
            using (NpgsqlCommand command = new NpgsqlCommand("INSERT INTO game (start_food,start_item,start_currency,field_size,daily_food,daily_item,daily_currency,admin_salary) VALUES (@v1, @v2,@v3,@v4,@v5,@v6,@v7,@v8)", connection))
            {
                NpgsqlCommand query = new NpgsqlCommand("ALTER SEQUENCE public.game_game_id_seq RESTART WITH 1;", connection);
                query.ExecuteNonQuery();
                query = new NpgsqlCommand("DELETE from game", connection);
                query.ExecuteNonQuery();
                command.Parameters.AddWithValue("@v1", Int32.Parse(textBox3.Text));
                command.Parameters.AddWithValue("@v2", Int32.Parse(textBox4.Text));
                command.Parameters.AddWithValue("@v3", Int32.Parse(textBox5.Text));
                command.Parameters.AddWithValue("@v4", Int32.Parse(textBox1.Text) + Convert.ToDouble(textBox2.Text)/10);
                command.Parameters.AddWithValue("@v5", Int32.Parse(textBox6.Text));
                command.Parameters.AddWithValue("@v6", Int32.Parse(textBox7.Text));
                command.Parameters.AddWithValue("@v7", Int32.Parse(textBox8.Text));
                command.Parameters.AddWithValue("@v8", Int32.Parse(textBox9.Text));
                command.ExecuteNonQuery();              
            }
           // NpgsqlCommand command2 = new NpgsqlCommand("INSERT INTO users (game_id,user_type,name,surname,password,food,item,currency,user_works) VALUES (@v1, @v2,@v3,@v4,@v5,@v6,@v7,@v8,@v9)", connection)
            using (NpgsqlCommand command = new NpgsqlCommand("INSERT INTO users (user_type) VALUES (@v1)", connection))
            {
                NpgsqlCommand query = new NpgsqlCommand("ALTER SEQUENCE public.users_user_id_seq RESTART WITH 1;",connection);
                query.ExecuteNonQuery();
                query = new NpgsqlCommand("DELETE from users", connection);
                query.ExecuteNonQuery();
                command.Parameters.AddWithValue("@v1", "Admin");
                command.ExecuteNonQuery();
             
            }
            connection.Close();
            userControl11.Width = this.ClientSize.Width;
            userControl11.Height = this.ClientSize.Height;
            userControl11.Visible = true;
        }
        private void Form1_Resize(object sender, EventArgs e)
        {
            userControl11.Width = this.ClientSize.Width;
            userControl11.Height = this.ClientSize.Height;
        }

    }
}

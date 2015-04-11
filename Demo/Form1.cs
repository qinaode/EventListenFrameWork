using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using ZK.EventFrameWork;

namespace Demo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            EventFrameWork.Listen(ReciveEvent, new EventModel());
        }

        private void btn_prase_Click(object sender, EventArgs e)
        {
            EventFrameWork.Fire(new EventModel() {  EventID=Guid.NewGuid(), EventContent="hahahah", EventType=EventType.Prase,CreateTime=DateTime.Now});
        }
        private void ReciveEvent(object sender, SqlNotificationEventArgs e)
        {
            if (e.Info==SqlNotificationInfo.Insert)
            {
                MessageBox.Show("监听到新的事件！");
            }
        }

    }
}

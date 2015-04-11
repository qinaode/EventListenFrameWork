namespace Demo
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_prase = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btn_prase
            // 
            this.btn_prase.Location = new System.Drawing.Point(12, 22);
            this.btn_prase.Name = "btn_prase";
            this.btn_prase.Size = new System.Drawing.Size(78, 35);
            this.btn_prase.TabIndex = 0;
            this.btn_prase.Text = "点赞";
            this.btn_prase.UseVisualStyleBackColor = true;
            this.btn_prase.Click += new System.EventHandler(this.btn_prase_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(386, 338);
            this.Controls.Add(this.btn_prase);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btn_prase;
    }
}


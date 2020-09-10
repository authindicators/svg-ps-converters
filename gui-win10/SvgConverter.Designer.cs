namespace svgConverter
{
    partial class SvgConverter
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.edtFilePath1 = new System.Windows.Forms.RichTextBox();
            this.btnBrowse = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.edtNewTitle = new System.Windows.Forms.RichTextBox();
            this.btnGenerate = new System.Windows.Forms.Button();
            this.lblVersion = new System.Windows.Forms.Label();
            this.lblBaseProfile = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(81, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(488, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "SVG Tiny 1.2     to     SVG Tiny Portable / Secure";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(12, 95);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(194, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "SVG Tiny 1.2 Format File :";
            // 
            // edtFilePath1
            // 
            this.edtFilePath1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.edtFilePath1.Location = new System.Drawing.Point(210, 92);
            this.edtFilePath1.Multiline = false;
            this.edtFilePath1.Name = "edtFilePath1";
            this.edtFilePath1.ReadOnly = true;
            this.edtFilePath1.Size = new System.Drawing.Size(373, 26);
            this.edtFilePath1.TabIndex = 2;
            this.edtFilePath1.Text = "";
            // 
            // btnBrowse
            // 
            this.btnBrowse.Location = new System.Drawing.Point(589, 94);
            this.btnBrowse.Name = "btnBrowse";
            this.btnBrowse.Size = new System.Drawing.Size(32, 23);
            this.btnBrowse.TabIndex = 3;
            this.btnBrowse.Text = ". . .";
            this.btnBrowse.UseVisualStyleBackColor = true;
            this.btnBrowse.Click += new System.EventHandler(this.btnBrowse_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(150, 185);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(56, 20);
            this.label3.TabIndex = 4;
            this.label3.Text = "Title * :";
            // 
            // edtNewTitle
            // 
            this.edtNewTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.edtNewTitle.Location = new System.Drawing.Point(210, 185);
            this.edtNewTitle.Multiline = false;
            this.edtNewTitle.Name = "edtNewTitle";
            this.edtNewTitle.Size = new System.Drawing.Size(373, 26);
            this.edtNewTitle.TabIndex = 5;
            this.edtNewTitle.Text = "";
            // 
            // btnGenerate
            // 
            this.btnGenerate.Enabled = false;
            this.btnGenerate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGenerate.Location = new System.Drawing.Point(183, 261);
            this.btnGenerate.Name = "btnGenerate";
            this.btnGenerate.Size = new System.Drawing.Size(285, 53);
            this.btnGenerate.TabIndex = 6;
            this.btnGenerate.Text = "Generate SVG Tiny P / S";
            this.btnGenerate.UseVisualStyleBackColor = true;
            this.btnGenerate.Click += new System.EventHandler(this.btnGenerate_Click);
            // 
            // lblVersion
            // 
            this.lblVersion.AutoSize = true;
            this.lblVersion.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblVersion.Location = new System.Drawing.Point(126, 141);
            this.lblVersion.Name = "lblVersion";
            this.lblVersion.Size = new System.Drawing.Size(80, 20);
            this.lblVersion.TabIndex = 7;
            this.lblVersion.Text = "Version :";
            // 
            // lblBaseProfile
            // 
            this.lblBaseProfile.AutoSize = true;
            this.lblBaseProfile.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblBaseProfile.Location = new System.Drawing.Point(354, 141);
            this.lblBaseProfile.Name = "lblBaseProfile";
            this.lblBaseProfile.Size = new System.Drawing.Size(116, 20);
            this.lblBaseProfile.TabIndex = 8;
            this.lblBaseProfile.Text = "Base Profile :";
            // 
            // SvgConverter
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(650, 358);
            this.Controls.Add(this.lblBaseProfile);
            this.Controls.Add(this.lblVersion);
            this.Controls.Add(this.btnGenerate);
            this.Controls.Add(this.edtNewTitle);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnBrowse);
            this.Controls.Add(this.edtFilePath1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "SvgConverter";
            this.Text = "SVG CONVERTER v0.1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RichTextBox edtFilePath1;
        private System.Windows.Forms.Button btnBrowse;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.RichTextBox edtNewTitle;
        private System.Windows.Forms.Button btnGenerate;
        private System.Windows.Forms.Label lblVersion;
        private System.Windows.Forms.Label lblBaseProfile;
    }
}


namespace ClinicaFrba.Elegir_Rol
{
    partial class Elegir_Rol
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
            this.Continuar = new System.Windows.Forms.Button();
            this.Salir = new System.Windows.Forms.Button();
            this.rolSelection = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(254, 22);
            this.label1.TabIndex = 0;
            this.label1.Text = "Elegir el rol que desea utilizar";
            // 
            // Continuar
            // 
            this.Continuar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F);
            this.Continuar.Location = new System.Drawing.Point(197, 186);
            this.Continuar.Name = "Continuar";
            this.Continuar.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.Continuar.Size = new System.Drawing.Size(75, 23);
            this.Continuar.TabIndex = 1;
            this.Continuar.Text = "Siguiente";
            this.Continuar.UseVisualStyleBackColor = true;
            this.Continuar.Click += new System.EventHandler(this.button1_Click);
            // 
            // Salir
            // 
            this.Salir.Location = new System.Drawing.Point(197, 227);
            this.Salir.Name = "Salir";
            this.Salir.Size = new System.Drawing.Size(75, 23);
            this.Salir.TabIndex = 5;
            this.Salir.Text = "Salir";
            this.Salir.UseVisualStyleBackColor = true;
            this.Salir.Click += new System.EventHandler(this.button2_Click);
            // 
            // rolSelection
            // 
            this.rolSelection.FormattingEnabled = true;
            this.rolSelection.Location = new System.Drawing.Point(16, 47);
            this.rolSelection.Name = "rolSelection";
            this.rolSelection.Size = new System.Drawing.Size(250, 21);
            this.rolSelection.TabIndex = 6;
            this.rolSelection.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // Elegir_Rol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 262);
            this.Controls.Add(this.rolSelection);
            this.Controls.Add(this.Salir);
            this.Controls.Add(this.Continuar);
            this.Controls.Add(this.label1);
            this.Name = "Elegir_Rol";
            this.Text = "Elegir_Rol";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button Continuar;
        private System.Windows.Forms.Button Salir;
        private System.Windows.Forms.ComboBox rolSelection;
    }
}
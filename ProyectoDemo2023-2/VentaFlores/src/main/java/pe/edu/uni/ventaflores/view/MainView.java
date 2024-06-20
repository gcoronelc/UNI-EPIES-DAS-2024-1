/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/MDIApplication.java to edit this template
 */
package pe.edu.uni.ventaflores.view;

import javax.swing.JInternalFrame;

/**
 *
 * @author LAB-A
 */
public class MainView extends javax.swing.JFrame {

    /**
     * Creates new form MainView
     */
    public MainView() {
        initComponents();
        this.setExtendedState(MAXIMIZED_BOTH);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        desktopPane = new javax.swing.JDesktopPane();
        menuBar = new javax.swing.JMenuBar();
        fileMenu = new javax.swing.JMenu();
        exitMenuItem = new javax.swing.JMenuItem();
        menuProcesos = new javax.swing.JMenu();
        menuProcesosRegistrarVenta = new javax.swing.JMenuItem();
        menuProcesosCobrarVenta = new javax.swing.JMenuItem();
        menuTablas = new javax.swing.JMenu();
        menuConsultas = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("SISTEMA DE VENTAS");

        fileMenu.setMnemonic('f');
        fileMenu.setText("File");

        exitMenuItem.setMnemonic('x');
        exitMenuItem.setText("Exit");
        exitMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                exitMenuItemActionPerformed(evt);
            }
        });
        fileMenu.add(exitMenuItem);

        menuBar.add(fileMenu);

        menuProcesos.setText("Procesos");

        menuProcesosRegistrarVenta.setText("Registrar Venta");
        menuProcesosRegistrarVenta.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuProcesosRegistrarVentaActionPerformed(evt);
            }
        });
        menuProcesos.add(menuProcesosRegistrarVenta);

        menuProcesosCobrarVenta.setText("Cobrar venta");
        menuProcesos.add(menuProcesosCobrarVenta);

        menuBar.add(menuProcesos);

        menuTablas.setText("Tablas");
        menuBar.add(menuTablas);

        menuConsultas.setText("Consultas");
        menuBar.add(menuConsultas);

        setJMenuBar(menuBar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(desktopPane, javax.swing.GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(desktopPane, javax.swing.GroupLayout.DEFAULT_SIZE, 279, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void exitMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_exitMenuItemActionPerformed
        System.exit(0);
    }//GEN-LAST:event_exitMenuItemActionPerformed

    private void menuProcesosRegistrarVentaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuProcesosRegistrarVentaActionPerformed
        mostrarForm(RegistraVentaView.class);
    }//GEN-LAST:event_menuProcesosRegistrarVentaActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainView().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDesktopPane desktopPane;
    private javax.swing.JMenuItem exitMenuItem;
    private javax.swing.JMenu fileMenu;
    private javax.swing.JMenuBar menuBar;
    private javax.swing.JMenu menuConsultas;
    private javax.swing.JMenu menuProcesos;
    private javax.swing.JMenuItem menuProcesosCobrarVenta;
    private javax.swing.JMenuItem menuProcesosRegistrarVenta;
    private javax.swing.JMenu menuTablas;
    // End of variables declaration//GEN-END:variables

    private void mostrarForm(Class<?> aClass) {
        try {
            // Variable de control
            JInternalFrame view = null;
            // Buscar instancia
            for (JInternalFrame form : desktopPane.getAllFrames()) {
                if (aClass.isInstance(form)) {
                    view = form;
                    break;
                }
            }
            // Crear instancia
            if (view == null) {
                view = (JInternalFrame) aClass.getConstructor().newInstance();
                desktopPane.add(view);
                view.setVisible(true);
                view.setMaximum(true);
            }
            view.setSelected(true);
        } catch (Exception e) {
        }
    }

}
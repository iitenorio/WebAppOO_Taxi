package br.com.fatecpg.parking;

import java.util.ArrayList;

public class AdicionarMotorista {
    private long id_motorista;
    private String nm_motorista;
    private String nr_cpf;
    private String tp_sexo;
    private String mdl_carro;
    private String email_motorista;

    public AdicionarMotorista(long id_motorista, String nm_motorista, String nr_cpf, String tp_sexo, String mdl_carro, String email_motorista) {
        this.id_motorista = id_motorista;
        this.nm_motorista = nm_motorista;
        this.nr_cpf = nr_cpf;
        this.tp_sexo = tp_sexo;
        this.mdl_carro = mdl_carro;
        this.email_motorista = email_motorista;
    }

    public String getMdl_carro() {
        return mdl_carro;
    }

    public void setMdl_carro(String mdl_carro) {
        this.mdl_carro = mdl_carro;
    }
    
    public long getId_motorista() {
        return id_motorista;
    }

    public void setId_motorista(long id_motorista) {
        this.id_motorista = id_motorista;
    }

    public String getNm_motorista() {
        return nm_motorista;
    }

    public void setNm_motorista(String nm_motorista) {
        this.nm_motorista = nm_motorista;
    }

    public String getNr_cpf() {
        return nr_cpf;
    }

    public void setNr_cpf(String nr_cpf) {
        this.nr_cpf = nr_cpf;
    }

    public String getTp_sexo() {
        return tp_sexo;
    }

    public void setTp_sexo(String tp_sexo) {
        this.tp_sexo = tp_sexo;
    }

    public String getEmail_motorista() {
        return email_motorista;
    }

    public void setEmail_motorista(String email_motorista) {
        this.email_motorista = email_motorista;
    }
    
    public static void addDriver(String nm_motorista, String nr_cpf, String tp_sexo, String mdl_carro, String email_motorista) throws Exception {
        String SQL = "INSERT INTO TB_MOTORISTA VALUES("
                + "default"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ")";
        Object parameters[] = {nm_motorista, nr_cpf, tp_sexo, mdl_carro, email_motorista};
        DatabaseConnector.execute(SQL, parameters);
    }
 
    public static void removePass(long id_motorista) throws Exception {
        String SQL = "DELETE FROM TB_MOTORISTA WHERE ID_MOTORISTA = ?";
        Object parameters[] = {id_motorista};
        DatabaseConnector.execute(SQL, parameters);
    }

    public static ArrayList<AdicionarMotorista> getDrivers() throws Exception {
        String SQL = "SELECT * FROM TB_MOTORISTA ORDER BY ID_MOTORISTA";
        ArrayList<AdicionarMotorista> drivers = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            AdicionarMotorista d = new AdicionarMotorista(
                    (long)row[0], 
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (String) row[4],
                    (String) row[5]);
            drivers.add(d);
        }
        return drivers;
    }

    
}
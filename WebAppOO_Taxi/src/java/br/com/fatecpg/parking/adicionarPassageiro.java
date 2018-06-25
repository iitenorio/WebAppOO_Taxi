package br.com.fatecpg.parking;

import java.util.ArrayList;

public class AdicionarPassageiro {
    private long id_passageiro;
    private String nm_passageiro;
    private String nr_cpf;
    private String tp_sexo;
    private String email_passageiro;
    private long passwordHash;

    public AdicionarPassageiro(long id_passageiro, String nm_passageiro, String nr_cpf, String tp_sexo, String email_passageiro, long passwordHash) {
        this.id_passageiro = id_passageiro;
        this.nm_passageiro = nm_passageiro;
        this.nr_cpf = nr_cpf;
        this.tp_sexo = tp_sexo;
        this.email_passageiro = email_passageiro;
        this.passwordHash = passwordHash;
    }
    
    public long getId_passageiro() {
        return id_passageiro;
    }

    public void setId_passageiro(long id_passageiro) {
        this.id_passageiro = id_passageiro;
    }

    public String getNm_passageiro() {
        return nm_passageiro;
    }

    public void setNm_passageiro(String nm_passageiro) {
        this.nm_passageiro = nm_passageiro;
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

    public String getEmail_passageiro() {
        return email_passageiro;
    }

    public void setEmail_passageiro(String email_passageiro) {
        this.email_passageiro = email_passageiro;
    }

    public long getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(long passwordHash) {
        this.passwordHash = passwordHash;
    }
    
    public static void addPass(String nm_passageiro, String nr_cpf, String tp_sexo, String email_passageiro, long passwordHash) throws Exception {
        String SQL = "INSERT INTO TB_PASSAGEIRO VALUES("
                + "default"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ")";
        Object parameters[] = {nm_passageiro, nr_cpf, tp_sexo, email_passageiro, passwordHash};
        DatabaseConnector.execute(SQL, parameters);
    }
 
    public static void removePass(long id_passageiro) throws Exception {
        String SQL = "DELETE FROM TB_PASSAGEIRO WHERE ID_PASSAGEIRO = ?";
        Object parameters[] = {id_passageiro};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static AdicionarPassageiro getPass(String email_passageiro, String passwordHash) throws Exception {
        String SQL = "SELECT * FROM TB_PASSAGEIRO WHERE email_passageiro = ? AND passwordHash = ?";
        Object parameters[] = {email_passageiro, passwordHash.hashCode()};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            AdicionarPassageiro p = new AdicionarPassageiro(
                    (long)row[0], 
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (String) row[4],
                    (long) row[5]);
            return p;
        }
    }

    public static ArrayList<AdicionarPassageiro> getPassa() throws Exception {
        String SQL = "SELECT * FROM TB_PASSAGEIRO";
        ArrayList<AdicionarPassageiro> passa = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            AdicionarPassageiro p = new AdicionarPassageiro(
                    (long)row[0], 
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (String) row[4],
                    (long) row[5]);
            passa.add(p);
        }
        return passa;
    }

    
}

package br.com.fatecpg.parking;

import java.util.ArrayList;

public class AdicionarCorrida {
    private long id_corrida;
    private Double qtd_km;
    private Double vl_corrida;
    private long tb_mot;
    private long tb_pass;

    public AdicionarCorrida(long id_corrida, Double qtd_km, Double vl_corrida, long tb_mot, long tb_pass) {
        this.id_corrida = id_corrida;
        this.qtd_km = qtd_km;
        this.vl_corrida = vl_corrida;
        this.tb_mot = tb_mot;
        this.tb_pass = tb_pass;
    }

    public long getId_corrida() {
        return id_corrida;
    }

    public void setId_corrida(long id_corrida) {
        this.id_corrida = id_corrida;
    }

    public Double getQtd_km() {
        return qtd_km;
    }

    public void setQtd_km(Double qtd_km) {
        this.qtd_km = qtd_km;
    }

    public Double getVl_corrida() {
        return vl_corrida;
    }

    public void setVl_corrida(Double vl_corrida) {
        this.vl_corrida = vl_corrida;
    }

    public long getTb_mot() {
        return tb_mot;
    }

    public void setTb_mot(long tb_mot) {
        this.tb_mot = tb_mot;
    }

    public long getTb_pass() {
        return tb_pass;
    }

    public void setTb_pass(long tb_pass) {
        this.tb_pass = tb_pass;
    }
    
    public static ArrayList<AdicionarCorrida> getRun() throws Exception {
        String SQL = "SELECT * FROM TB_CORRIDA";
        ArrayList<AdicionarCorrida> run = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            AdicionarCorrida r = new AdicionarCorrida(
                    (long)row[0], 
                    (double) row[1],
                    (double) row[2],
                    (long) row[3],
                    (long) row[4]);
            run.add(r);
        }
        return run;
    }
    
    public static void addRunning(Double qtd_km, Double vl_corrida, long tb_mot, long tb_pass) throws Exception {
        String SQL = "INSERT INTO TB_CORRIDA VALUES("
                + "default"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ")";
        Object parameters[] = {qtd_km, vl_corrida, tb_mot, tb_pass};
        DatabaseConnector.execute(SQL, parameters);
    }
}

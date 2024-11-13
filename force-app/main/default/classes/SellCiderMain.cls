public  class SellCiderMain implements IBrewBeer{
    private BrewBeer br;
    public SellCiderMain(BrewBeer abr){
        this.br = abr;        
    }

    public void execute(){
        br.SellCider();
    }

}
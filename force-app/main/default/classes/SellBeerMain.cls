public with sharing class SellBeerMain implements IBrewBeer {

    private BrewBeer br;
    public SellBeerMain(BrewBeer abr){
        this.br = abr;
    }
    public void execute(){
        br.SellBeer();
    }
}
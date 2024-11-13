public with sharing class BrewBeerMain implements IBrewBeer {
    BrewBeer br;
    public BrewBeerMain(BrewBeer abr) {
        this.br = abr;

    }

    public void execute(){
        br.BrewBeer();
    }
}
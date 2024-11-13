public class MiddleLayerClass {
    // private List<IBrewBeer> BrewList = new List<IBrewBeer>();

    public static void processBrewandSell(List<IBrewBeer> blist){
        for (IBrewBeer ib : blist) {
            ib.execute();
        }
    }
}
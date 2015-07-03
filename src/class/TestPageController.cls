public class TestPageController {

    public IDCarrier idValue1{get;set;}
	public IDCarrier idValue2{get;set;}
    public TestPageController(){
        this.idValue1 = new IDCarrier([Select Id From Account Limit 1].Id);
		this.idValue2 = new IDCarrier();
    }
    public void submit(){
		//...
	}

}
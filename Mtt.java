import java.text.DecimalFormat;

public class Mtt {

	protected static String run() {
		long x=0;
		int i;
		long startTime = System.nanoTime();
		long endTime;
		double timeDelta;

		for(i=1; i<350000001; i++) {
			if((i%3)==0)
				continue;
			if((i%2)==0)
				continue;
			x+=i;
		}

		endTime = System.nanoTime();

		timeDelta = (endTime - startTime) / (1000.0 * 1000.0 * 1000.0);

		return Long.valueOf(x).toString() + ", " + new DecimalFormat("#.######").format(timeDelta);
	}

	public static void main(String[] args) {
		System.out.println(run());
	}
}


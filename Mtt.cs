using System;

namespace Mtt
{
	class MainClass
	{
		protected static string run() {
			long x=0;
			int i;

			var start_time = System.Diagnostics.Stopwatch.StartNew();

			for(i=1; i<350000001; i++)
			{
				if((i%3)==0)
					continue;
				if((i%2)==0)
					continue;
				x+=i;
			}

			start_time.Stop();

			var end_time = start_time.ElapsedMilliseconds / 1000.0;

			return x.ToString() + ", " + end_time.ToString();
		}

		public static void Main (string[] args)
		{
			Console.WriteLine (run());
		}
	}
}


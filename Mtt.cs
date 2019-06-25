using System;

namespace Mtt
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			long x=0;
			int i;
		
			for(i=1; i<350000001; i++)
			{
				if((i%3)==0)
					continue;
				if((i%2)==0)
					continue;
				x+=i;
			}

			Console.WriteLine (x);
		}
	}
}

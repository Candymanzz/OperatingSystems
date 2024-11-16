using System.Globalization;

namespace osl2z2
{
    class Program
    {
        public static void Main(string[] args)
        {
            var param = Console.ReadLine()!;

            // Теперь ожидаем только число
            double s = double.Parse(param.Replace(",", "."), CultureInfo.InvariantCulture);
            Z2(s);
        }

        public static void Z2(double s)
        {
            Console.WriteLine($"Результат: {Math.Pow(s, 3)}");
        }
    }
}
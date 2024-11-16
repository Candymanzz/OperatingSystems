using System.Globalization;

namespace osl2z1
{
    class Progarm
    {
        public static void Main()
        {
            string strParams = Console.ReadLine()!;
            string[] arrStrParams = strParams.Split(" ", StringSplitOptions.RemoveEmptyEntries);

            if (arrStrParams.Length != 4)
            {
                Console.WriteLine("Неверный формат входных данных. Пожалуйста, введите 4 числа через пробел.");
                return;
            }

            double A = double.Parse(arrStrParams[0], CultureInfo.InvariantCulture);
            double l = double.Parse(arrStrParams[1], CultureInfo.InvariantCulture);
            double B = double.Parse(arrStrParams[2], CultureInfo.InvariantCulture);
            double i = double.Parse(arrStrParams[3], CultureInfo.InvariantCulture);

            Z1(A, l, B, i);
        }

        public static void Z1(double A, double l, double B, double i)
        {
            double sum = 0;
            for (double j = l; j <= B; j++)
            {
                sum += Math.Sqrt(A) + i;
            }
            // Выводим только числовое значение
            Console.WriteLine(sum);
        }
    }
}
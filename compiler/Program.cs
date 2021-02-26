using static System.Console;
using System;
using System.Linq;
using System.IO;
using System.Collections.Generic;

StreamWriter writer = new StreamWriter("code.asm");

foreach (string line in readfile())
{
    
}

writer.Close();

IEnumerable<string> readfile()
{
    string file;
    if (args.Length == 0)
        file = "main.c";
    else file = args[0];
    StreamReader reader = new StreamReader(file);
    StreamReader include = null, crr = reader;
    string line;
    while (!reader.EndOfStream)
    {
        while (!crr.EndOfStream)
        {
            line = crr.ReadLine();
            if (line.Length > 8 && line.Substring(0, 8) == "#include")
            {
                line = line.Substring(9).Replace("\"", "");
                include = new StreamReader(line);
                crr = include;
            }
            else yield return line;
        }
        if (crr == include)
        {
            include.Close();
            crr = reader;
        }
    }

    reader.Close();
    yield break;
}

string tohex(int n)
{
    if (n == 0)
        return "";
    int k = n % 16;
    if (k < 10)
        return tohex(n / 16) + (char)(k + '0');
    else return tohex(n / 16) + (char)(k - 10 + 'a');
}
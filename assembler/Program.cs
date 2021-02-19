using static System.Console;
using System;
using System.Linq;
using System.IO;
using System.Collections.Generic;

StreamReader reader = new StreamReader(args[0]);
StreamWriter writer = new StreamWriter("memory");
writer.WriteLine("v2.0 raw");

string code;
int linecount = 0;

var dic = new Dictionary<string, int>();
var lines = new List<string>();

while (!reader.EndOfStream)
    lines.Add(reader.ReadLine());

linecount = 0;
foreach (var line in lines)
{
    if (line[line.Length - 1] == ':')
        dic.Add(line.Substring(0, line.Length -1), linecount);
    else linecount++;
}

foreach (var line in lines.Where(line => line[line.Length - 1] != ':'))
{
    code = tocomplang(line);
    writer.WriteLine(code);
}

writer.WriteLine((4096-linecount).ToString() + "*0000");

writer.Close();
reader.Close();


string tohex(int n)
{
    if (n == 0)
        return "";
    int k = n % 16;
    if (k < 10)
        return tohex(n / 16) + (char)(k + '0');
    else return tohex(n / 16) + (char)(k - 10 + 'a');
}

string tocomplang(string assembly)
{
    var asmargs = assembly
        .Replace(',', ' ')
        .Replace('\t', ' ')
        .Split(' ', StringSplitOptions.RemoveEmptyEntries);
    int n;
    switch (asmargs[0])
    {
        case "mov":
            if (asmargs[1][0] == '$') //move register
            {
                n = 5 << 13;
                goto addregisters;
            }
            else //move constant
            {
                n = 1 << 15;
                n += int.Parse(asmargs[1]) << 5;
                n += int.Parse(asmargs[2].Substring(1));
                return tohex(n);
            }
        case "add":
            n = 8 << 10;
            goto addregisters;
        case "sub":
            n = 9 << 10;
            goto addregisters;
        case "mul":
            n = 10 << 10;
            goto addregisters;
        case "div":
            n = 11 << 10;
            goto addregisters;
        case "shl":
            n = 12 << 10;
            goto addregisters;
        case "shr":
            n = 13 << 10;
            goto addregisters;
        case "and":
            n = 14 << 10;
            goto addregisters;
        case "or":
            n = 15 << 10;
            goto addregisters;
        case "not":
            n = 42 << 10;
            n += int.Parse(asmargs[1].Substring(1)) << 5;
            return tohex(n);
        case "cmp":
            n = 41 << 10;
            goto addregisters;
        case "je":
            n = 12 << 12;
            goto dictadd;
        case "jne":
            n = 13 << 12;
            goto dictadd;
        case "jg":
            n = 14 << 12;
            goto dictadd;
        case "jmp":
            n = 15 << 12;
            goto dictadd;
        case "loa":
            n = 2 << 13;
            goto addregisters;
        case "str":
            n = 3 << 13;
            goto addregisters;
        case "push":
            n = 43 << 10;
            n += int.Parse(asmargs[1].Substring(1)) << 5;
            return tohex(n);
        case "pop":
            n = 44 << 10;
            n += int.Parse(asmargs[1].Substring(1)) << 5;
            return tohex(n);
        case "nop":
            return "0000";

        dictadd:
            n += dic[asmargs[1]];
            return tohex(n);
        
        addregisters:
            n += int.Parse(asmargs[1].Substring(1)) << 5;
            n += int.Parse(asmargs[2].Substring(1));
            return tohex(n);
    }
    return "";
}
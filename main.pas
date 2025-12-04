program Integrals;
uses Crt;

var 
    current, run: integer;
    key: char;

const 
    N: integer = 3;
    list: array[0..2] of string = ('Exit', 'Second', 'Third');

procedure renderList;
    var i: integer;
begin
    
    for i := 0 to N-1 do begin
        if i = current then write('--> ');
        
        writeln(list[i]);
    end;
end;

procedure proceedCurrent;
begin
    writeln('Proceed current: ', current, '!');

    case current of
        0: run := 0;
        1: write('Second!');
        2: write('Third!');
    end; 
end;

begin
    writeln('Hello World');
    ClrScr;

    { Is program running? }
    run := 1;
    
    { Current list's value index }
    current := 0;
    while run <> 0 do begin
        renderList;
        key := ReadKey;
    
        ClrScr;
        { Match arrow keys and enter }
        case key of
            #72: current -= 1;
            #80: current += 1;
            #13: proceedCurrent;
        end;

        current := (current + N) mod N;
    end;
end.
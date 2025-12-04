program Integrals;
uses Crt;

var current, key, run: integer;

const 
    N: integer = 3;
    
    
    list: array[0..2] of string = ('First', 'Second', 'Third');

procedure renderList();
    var i: integer;
begin
    
    for i := 0 to N-1 do begin
        if i = current then write('--> ');
        
        writeln(list[i]);
    end;
end;

begin
    writeln('Hello World');
    ClrScr;

    { Is program running }
    run := 1;
    
    { Current list's value index }
    current := 0;
    key := 0;

    while run <> 0 do begin
        renderList();
        readln(key);
    
        ClrScr;
        writeln('Test');
    end;
    
end.

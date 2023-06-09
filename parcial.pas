program parcial;

const
	dimF = 20;

type
	
	producto = record
		nombre : string;
		precioKilo : real;
	end;
	
	vCategorias = array [1 .. dimF] of producto;
	
	vContador = array [1 .. dimF] of integer;
	
	compra = record
		dniCliente : integer;
		categoria : integer; //pueden utilizar un subrango si lo desean :)
		cantKilosComprados : real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato : compra;
		sig : lista;
	end;

procedure iniVector(var vc: vContador);
	var
		i:integer;
	begin
		for i:= 1 to dimF do
			vc[i] := 0;
	end;

procedure leer(var c:compra);
	begin
		writeln('Ingrese el dni del cliente');
		readln(c.dniCliente);
		if(c.dniCliente <> -1)then
			begin
				writeln('Ingrese la categoria del producto: ');
				readln(c.categoria);
				writeln('Ingrese la cantidad de kilos comprados del producto: ');
				readln(c.cantKilosComprados);
			end;
	end;

procedure agregarAtras (var pri, ult: lista; c: compra);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato := c;
		nue^.sig:= nil;
		if(pri = nil)then
			pri:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;
	
procedure cargarLista(var l: lista);
	var
		ult: lista;
		c:compra;
	begin
		leer(c);
		while(c.dniCliente <> -1)do 
			begin
				agregarAtras(l, ult, c);
				leer(c);
			end;
	end;
	
function digitosImpares(dni:integer):boolean;
	var
		digito, impar:integer;
		ok:boolean;
	begin
		ok:= false;
		impar:= 0;
		while(dni <> 0)do
			begin
				digito:= dni mod 10;
				if((digito mod 2) = 1) then
					impar:= impar + 1;
				dni:= dni div 10;
			end;
		if(impar <= 5)then
			ok:= true;
		digitosImpares:= ok;
	end;
	
procedure corteDeControl (l: lista; vCat: vCategorias; var vCont: vContador; var clienteGastoMenos: integer; var comprasClientesDigImpares: integer);
	var
		DNIClienteActual, cantComprasXCliente:integer;
		dineroGastadoXCliente, minDineroGastado:real;
	begin
		minDineroGastado:= 9999;
		while(l <> nil)do
			begin
				cantComprasXCliente:= 0;
				dineroGastadoXCliente:= 0;
				DNIClienteActual:= l^.dato.dniCliente;
				while(DNIClienteActual = l^.dato.dniCliente) and (l <> nil) do
					begin
						dineroGastadoXCliente:= dineroGastadoXCliente + vCat[l^.dato.categoria].precioKilo * l^.dato.cantKilosComprados;
						cantComprasXCliente:= cantComprasXCliente + 1;
						vCont[l^.dato.categoria] := vCont[l^.dato.categoria] + 1;
						l:= l^.sig;
					end;
				if(dineroGastadoXCliente < minDineroGastado)then
					begin
						clienteGastoMenos:= DNIClienteActual;
						minDineroGastado:= dineroGastadoXCliente;
					end;
				if(digitosImpares(DNIClienteActual))then
					comprasClientesDigImpares:= comprasClientesDigImpares + cantComprasXCliente;
			end;
	end;

var
	l:lista;
	vCat: vCategorias;
	vCont: vContador; //SE DISPONE
	clienteGastoMenos, comprasClientesDigImpares, i: integer;
begin
	iniVector(vCont);
	l:= nil;
	cargarLista(l);
	corteDeControl(l, vCat, vCont, clienteGastoMenos, comprasClientesDigImpares);
	writeln('El cliente que gasto menos dinero tiene el dni: ', clienteGastoMenos);
	writeln('La cantidad de compras realizadas por clientes con al menos 5 digitos impares en su dni son: ', comprasClientesDigImpares);
	for i:= 1 to dimF do
		writeln('Cantidad de compras para la categoria ', i, ' son: ', vCont[i]);
end.

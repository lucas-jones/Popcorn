package popcorn;

class Playground
{
	public static function main()
	{
		var exampleCode:Array<Int> = 
		[
			VM.PUSH, 2,
			VM.PUSH, 4,
			VM.MULTI,
			VM.PRINT,
			VM.EXIT
		];

		var vm:VM = new VM(exampleCode);
		vm.run();
	}
}

class VM
{
	public static inline var EXIT:Int = 0;
	public static inline var PRINT:Int = 1;	// Pop and Print
	public static inline var PUSH:Int = 2;	// Push to stack
	public static inline var MULTI:Int = 3;	// Multi pop * 2

	var code:Array<Int>;
	var stack:Array<Int>;

	var codePointer:Int;

	public function new(code:Array<Int>)
	{
		this.stack = [];
		this.code = code;
	}

	public function run(entryPoint:Int = 0)
	{
		this.codePointer = entryPoint;

		while(true)
		{
			// Decode
			var opcode:Int = code[codePointer++];

			switch(opcode)
			{
				case PUSH:
					stack.push(code[codePointer++]);

				case MULTI:
					stack.push(stack.pop() * stack.pop());

				case PRINT:
					trace(stack.pop());

				case EXIT:
					break;
			}
		}

		trace("Program Ended");
	}
}
# http://rosettacode.org/wiki/Sierpinski_triangle#Raku

use v6;
use Test;

plan 1;

my $rosetta-code = {

#### RC-begin
sub sierpinski ($n) {
    my @down  = '*';
    my $space = ' ';
    for ^$n {
        @down = flat @down.map({"$space$_$space"}), @down.map({"$_ $_"});
        $space ~= $space;
    }
    return @down;
}
 
.say for sierpinski 4;
#### RC-end

}

my $oldOUT = $*OUT;
my $output;
$*OUT = class {
    method print(*@args) {
        $output ~= @args.join;
    }
}

$rosetta-code.();

my $expected = "               *               
              * *              
             *   *             
            * * * *            
           *       *           
          * *     * *          
         *   *   *   *         
        * * * * * * * *        
       *               *       
      * *             * *      
     *   *           *   *     
    * * * *         * * * *    
   *       *       *       *   
  * *     * *     * *     * *  
 *   *   *   *   *   *   *   * 
* * * * * * * * * * * * * * * *
";

$*OUT = $oldOUT;
is($output.subst("\r\n", "\n", :g), $expected.subst("\r\n", "\n", :g), "Sierpinski Triangle");

# vim: expandtab shiftwidth=4

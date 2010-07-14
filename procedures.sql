CREATE OR REPLACE FUNCTION tr_categorias_valida_hierarquia_func()
 RETURNS trigger AS $tr_categorias_valida_hierarquia_func$
  if ($_TD->{new}{tr_categoria_mae_id}) {
    $_SHARED{tr_categorias_valida_plan} ||=
       spi_prepare('SELECT codigo,nivel FROM tr_categorias WHERE tr_categoria_id=$1', 'INTEGER');
    my $rv = spi_exec_prepared($_SHARED{tr_categorias_valida_plan}, $_TD->{new}{tr_categoria_mae_id});
    my $codigo = $rv->{rows}[0]{codigo};
    my $nivel = $rv->{rows}[0]{nivel};
    unless ($_TD->{new}{codigo} =~ /^$codigo.+$/ &&
            $_TD->{new}{nivel} == $nivel + 1) {
      die 'valores de nivel e/ou codigo invalidos para hierarquia de categorias';
    }
  } else {
    if ($_TD->{new}{nivel} && $_TD->{new}{nivel} > 0) {
      die 'valor invalido para a coluna nivel quando nao tem categoria mae';
    }
  } 
  return MODIFY;
$tr_categorias_valida_hierarquia_func$ LANGUAGE plperl;

CREATE TRIGGER tr_categorias_valida_hierarquia_trigger
 BEFORE INSERT OR UPDATE ON tr_categorias
 FOR EACH ROW EXECUTE PROCEDURE tr_categorias_valida_hierarquia_func();
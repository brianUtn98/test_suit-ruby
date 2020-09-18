

def test_suite(&test_suite_definition)
  test_suite = TestSuite.new(&test_suite_definition)
  test_suite.ejecutar(notificar_resultados: true)
end

#Init Test
class Test
  def initialize(contenido)
    @contenido = contenido
  end
  def ejecutar
    @fallar = proc {return :fail}
    instance_eval(&@contenido)
    :pass
  end

  def assert(un_booleano)
    if un_booleano.eql?(false)
      @fallar.call
    end

  end

  def deny(un_booleano)
    if un_booleano.eql?(true)
      @fallar.call
    end
  end
end
#Fin Test
  
#Init Testsuite
class TestSuite
  def initialize(&suite_definition)
    @test = []
    instance_eval(&suite_definition)
  end

  def test(&suite_definition)
    @test << Test.new(suite_definition)
  end

  def mostrar_resultado(resultado)
    if resultado == :fail
      puts 'FAIL'.red
    else
      puts 'PASS'.green
    end
  end

  def ejecutar(notificar_resultados: true)
    @test.each do |unTest|
      resultado = unTest.ejecutar
      if(notificar_resultados)
        mostrar_resultado(resultado)
      end

    end
  end
end
  
#Fin TestSuite

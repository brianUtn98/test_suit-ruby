require '../lib/testing_framework'
require 'rspec'
require 'colored'



test_suite do
  test do
    se_ha_ejecutado = false
    test_suite = TestSuite.new do
      test {se_ha_ejecutado = true }
    end

    test_suite.ejecutar(notificar_resultados: false )

    assert se_ha_ejecutado
  end

  test do
    se_ha_ejecutado = false
    test_suite = TestSuite.new do
      test {se_ha_ejecutado = true }
    end


    deny se_ha_ejecutado
  end

  test do
    se_ha_ejecutado = false
    test_suite = TestSuite.new do
      test do
        assert false
        se_ha_ejecutado = true
      end
    end

    test_suite.ejecutar(notificar_resultados: false)
    deny se_ha_ejecutado
  end

  test do
    se_ha_ejecutado = false
    test_suite = TestSuite.new do
      test do
        assert (2+2 == 4)
        assert 2<3
        se_ha_ejecutado = true
      end
    end

    test_suite.ejecutar(notificar_resultados: false )

    assert se_ha_ejecutado
  end

end
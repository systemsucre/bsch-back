
import pool from './bdConfig.js'

export class Reportes {


    proyecto = async () => {
        const sql = `SELECT id,  nombre from proyecto where eliminado = false`
        const [rows] = await pool.query(sql)
        return rows
    }

    personal = async () => {
        const sql = `SELECT p.id, concat(p.nombre,' ',p.apellido1,' ',p.apellido2) as nombre from personal p inner join rol r on 
        p.idrol = r.id   where eliminado = false and r.numero = 2;`
        const [rows] = await pool.query(sql)
        console.log(rows)
        return rows
    }

    tipo = async () => {
        const sql = `SELECT id as value,  tipo as label from tipo where eliminado = false`
        const [rows] = await pool.query(sql)
        return rows
    }

    // por proyecto

    listaGastoPorProyecto = async (id) => {
        const sql = `select p.nombre as proyecto, concat(pe.nombre,' ',pe.apellido1,' ',pe.apellido2) as personal, a.descripcion as descripcionasignacion,
        a.comprobante as detalleasignacion, 
        g.descripcion as descripciongasto, g.comprobante as detallegasto, t.tipo as tipogasto, c.clasificacion as clasificaciongasto, DATE_FORMAT(g.fecha, "%Y-%m-%d") as fechagasto,
        g.egreso as egresogasto, g.tipo as metodo, g.factura as facturagasto, pr.nombre as proveedor

        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        
        inner join gasto g on a.id = g.idasignacion
        inner join tipo t on t.id = g.idtipo
        inner join clasificacion c on c.id = g.idclasificacion
        inner join personal pe on pe.id = g.idpersonal
        left join proveedor pr on pr.id = g.idproveedor
        where a.eliminado = false and a.estado = 3 and p.id = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)}`
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista gastos realizados')
        return rows
    }

    listaAsignacionPorProyecto = async (id) => {
        const sql = `select
        concat(pe.nombre,' ',pe.apellido1,' ',pe.apellido2) as personal, p.nombre as proyecto, a.descripcion, a.comprobante, a.tipo, a.estado, a.monto,
        DATE_FORMAT(a.fecha, "%Y-%m-%d") as fechaasignacion,DATE_FORMAT(a.fecharendicion, "%Y-%m-%d") as fecharendicion, DATE_FORMAT(a.fechaaprobacion, "%Y-%m-%d") as fechaaprobacion
        from proyecto p  
        inner join asignacion a on p.id = a.idproyecto
        inner join personal pe on a.idpersonal = pe.id
        where a.eliminado = false and a.estado = 3 and p.id = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)} `
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista de asignaciones')
        return rows
    }


    generarReportePorProyecto = async (id) => {
        // console.log(id, 'modelo')
        const sqlgasto = `select sum(g.egreso) as totalgasto
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join gasto g on a.id = g.idasignacion
        where a.eliminado = false and a.estado = 3 and p.id  = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [gasto] = await pool.query(sqlgasto)

        const sqlasignacion = `select sum(a.monto) as totalasignacion
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        where a.eliminado = false and a.estado = 3 and p.id  = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [asignacion] = await pool.query(sqlasignacion)


        const sqlCantidadGasto = `select count(g.id) as cantidadgasto
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join gasto g on a.id = g.idasignacion
        where a.eliminado = false and a.estado = 3 and p.id  = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [cantidadGasto] = await pool.query(sqlCantidadGasto)


        const sqlCantidadAsignacion = `select count(a.id) as cantidadasignacion
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        where a.eliminado = false and a.estado = 3 and p.id  = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [cantidadAsignacion] = await pool.query(sqlCantidadAsignacion)




        const slqtotales = `select sum(g.egreso) as egreso, (p.montocontrato+montomodificado) as total
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join gasto g on g.idasignacion = a.id
        where a.eliminado = false and p.id  = ${pool.escape(id.proyecto)}`
        const [totales] = await pool.query(slqtotales)
        // console.log(totales)

        const listGasto = await this.listaGastoPorProyecto(id)
        const listAsignacion = await this.listaAsignacionPorProyecto(id)
        // console.log(listAsignacion, listGasto)

        return [gasto[0], asignacion[0], listGasto, listAsignacion, cantidadGasto[0], cantidadAsignacion[0], totales]
    }


    // por persona

    listarGastoPorPersona = async (id) => {
        const sql = `select p.nombre as proyecto, concat(pe.nombre,' ',pe.apellido1,' ',pe.apellido2) as personal, a.descripcion as descripcionasignacion,
        a.comprobante as detalleasignacion, 
        g.descripcion as descripciongasto, g.comprobante as detallegasto, t.tipo as tipogasto, c.clasificacion as clasificaciongasto, DATE_FORMAT(g.fecha, "%Y-%m-%d") as fechagasto,
        g.egreso as egresogasto, g.tipo as metodo, g.factura as facturagasto, pr.nombre as proveedor

        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join personal pe on pe.id = a.idpersonal
        
        inner join gasto g on a.id = g.idasignacion
        inner join tipo t on t.id = g.idtipo
        inner join clasificacion c on c.id = g.idclasificacion
        left join proveedor pr on pr.id = g.idproveedor
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} 
        and pe.id = ${pool.escape(id.persona)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)}`
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista gastos realizados')
        return rows
    }

    listarAsignacionPorPersona = async (id) => {
        const sql = `select
        concat(pe.nombre,' ',pe.apellido1,' ',pe.apellido2) as personal, p.nombre as proyecto, a.descripcion, a.comprobante, a.tipo, a.estado, a.monto,
        DATE_FORMAT(a.fecha, "%Y-%m-%d") as fechaasignacion,DATE_FORMAT(a.fecharendicion, "%Y-%m-%d") as fecharendicion, DATE_FORMAT(a.fechaaprobacion, "%Y-%m-%d") as fechaaprobacion
        from proyecto p  
        inner join asignacion a on p.id = a.idproyecto
        inner join personal pe on a.idpersonal = pe.id
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} 
        and pe.id = ${pool.escape(id.persona)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)} `
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista de asignaciones')
        return rows
    }

    



    generarReportePorPersona = async (id) => {
        console.log(id, 'modelo')
        const sqlgasto = `select sum(g.egreso) as totalgasto
        
        from personal pe  
        inner join asignacion a on pe.id = a.idpersonal
        inner join gasto g on a.id = g.idasignacion
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and pe.id = ${pool.escape(id.persona)}
         and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [gasto] = await pool.query(sqlgasto)

        const sqlasignacion = `select sum(a.monto) as totalasignacion
        from personal pe  
        inner join asignacion a on pe.id = a.idpersonal
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and pe.id = ${pool.escape(id.persona)}
         and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [asignacion] = await pool.query(sqlasignacion)


        const sqlCantidadGasto = `select count(g.id) as cantidadgasto
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join gasto g on a.id = g.idasignacion
        inner join personal pe on pe.id = a.idpersonal
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and pe.id = ${pool.escape(id.persona)}
        and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [cantidadGasto] = await pool.query(sqlCantidadGasto)


        const sqlCantidadAsignacion = `select count(a.id) as cantidadasignacion
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join personal pe on pe.id = a.idpersonal
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and pe.id = ${pool.escape(id.persona)}
        and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [cantidadAsignacion] = await pool.query(sqlCantidadAsignacion)





        const listGasto = await this.listarGastoPorPersona(id)
        const listAsignacion = await this.listarAsignacionPorPersona(id)
        console.log(listAsignacion, 'gasto')

        return [gasto[0], asignacion[0], listGasto, listAsignacion, cantidadGasto[0], cantidadAsignacion[0]]
    }


    /// por estado de asignacion
 
    listaGastoPorEstado = async (id) => {
        const sql = `select p.nombre as proyecto, concat(pe.nombre,' ',pe.apellido1,' ',pe.apellido2) as personal, a.descripcion as descripcionasignacion,
        a.comprobante as detalleasignacion, 
        g.descripcion as descripciongasto, g.comprobante as detallegasto, t.tipo as tipogasto, c.clasificacion as clasificaciongasto, DATE_FORMAT(g.fecha, "%Y-%m-%d") as fechagasto,
        g.egreso as egresogasto, g.tipo as metodo, g.factura as facturagasto, pr.nombre as proveedor

        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        
        inner join gasto g on a.id = g.idasignacion
        inner join tipo t on t.id = g.idtipo
        inner join clasificacion c on c.id = g.idclasificacion
        inner join personal pe on pe.id = g.idpersonal
        left join proveedor pr on pr.id = g.idproveedor
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)}`
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista gastos realizados')
        return rows
    }

    listaAsignacionPorEstado = async (id) => {
        const sql = `select
        concat(pe.nombre,' ',pe.apellido1,' ',pe.apellido2) as personal, p.nombre as proyecto, a.descripcion, a.comprobante, a.tipo, a.estado, a.monto,
        DATE_FORMAT(a.fecha, "%Y-%m-%d") as fechaasignacion,DATE_FORMAT(a.fecharendicion, "%Y-%m-%d") as fecharendicion, DATE_FORMAT(a.fechaaprobacion, "%Y-%m-%d") as fechaaprobacion
        from proyecto p  
        inner join asignacion a on p.id = a.idproyecto
        inner join personal pe on a.idpersonal = pe.id
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)} `
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista de asignaciones')
        return rows
    }


    generarReportePorEstado = async (id) => {
        // console.log(id, 'modelo')
        const sqlgasto = `select sum(g.egreso) as totalgasto
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join gasto g on a.id = g.idasignacion
        where a.eliminado = false and a.estado =  ${pool.escape(id.estado)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [gasto] = await pool.query(sqlgasto)

        const sqlasignacion = `select sum(a.monto) as totalasignacion
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [asignacion] = await pool.query(sqlasignacion)


        const sqlCantidadGasto = `select count(g.id) as cantidadgasto
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join gasto g on a.id = g.idasignacion
        where a.eliminado = false and a.estado  = ${pool.escape(id.estado)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [cantidadGasto] = await pool.query(sqlCantidadGasto)


        const sqlCantidadAsignacion = `select count(a.id) as cantidadasignacion
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        where a.eliminado = false and a.estado = ${pool.escape(id.estado)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [cantidadAsignacion] = await pool.query(sqlCantidadAsignacion)




        const slqtotales = `select sum(g.egreso) as egreso, (p.montocontrato+montomodificado) as total
        
        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join gasto g on g.idasignacion = a.id
        where a.eliminado = false and p.id  = ${pool.escape(id.proyecto)}`
        const [totales] = await pool.query(slqtotales)
        // console.log(totales)

        const listGasto = await this.listaGastoPorEstado(id)
        const listAsignacion = await this.listaAsignacionPorEstado(id)
        // console.log(listAsignacion, listGasto)

        return [gasto[0], asignacion[0], listGasto, listAsignacion, cantidadGasto[0], cantidadAsignacion[0], totales]
    }


    // por tipo

    totalGatoPorTipo = async (id) => {
        const sql = `select sum(g.egreso) as total
            from proyecto p 
            left join asignacion a on p.id = a.idproyecto
            left join gasto g on a.id = g.idasignacion
            left join tipo t on g.idtipo = t.id

            where a.eliminado = false and a.estado = 3 and t.id = ${pool.escape(id.tipo)}  and p.id = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)} GROUP by p.id;`
        console.log(sql)
        const [rows] = await pool.query(sql)
        if (rows.length === 0)
            return [0]
        return rows
    }

    totalAsignacionPorTipo = async (id) => {
        const sql = `select sum(a.monto) as total
                from proyecto p
                inner join asignacion a on p.id = a.idproyecto
                where a.eliminado = false and a.estado = 3 and  p.id = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha<=${pool.escape(id.fin)} GROUP by p.id;`
        console.log(sql)
        const [rows] = await pool.query(sql)
        if (rows.length === 0)
            return [0]
        return rows
        // return rows
    }


    generarReportePorTipo = async (id) => {
        console.log(id, 'modelo')
        const sql = `select p.nombre as proyecto, concat(pe.nombre,' ', pe.apellido1, pe.apellido2) as personal, DATE_FORMAT(a.fecha, "%Y-%m-%d") as fechaasignacion,
        a.monto as montoasignado, a.descripcion as descripcionasignacion,a.comprobante as comprobanteasignacion, DATE_FORMAT(g.fecha, "%Y-%m-%d") as fechagasto, g.descripcion as descripciongasto, g.egreso as gasto, 
        g.comprobante as comprobantegasto

        from proyecto p 
        inner join asignacion a on p.id = a.idproyecto
        inner join personal pe on pe.id = a.idpersonal
        left join gasto g on a.id = g.idasignacion
        left join tipo t on g.idtipo = t.id

        where a.eliminado = false and a.estado = 3 and t.id= ${pool.escape(id.tipo)} and p.id  = ${pool.escape(id.proyecto)} and a.fecha>=${pool.escape(id.ini)} and a.fecha <= ${pool.escape(id.fin)}`
        const [rows] = await pool.query(sql)

        const [gasto] = await this.totalGatoPorTipo(id)
        const [total] = await this.totalAsignacionPorTipo(id)

        return [rows, total, gasto]
    }

}
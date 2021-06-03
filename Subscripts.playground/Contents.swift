struct TimesTable{
    let multiplier: Int
    
    //get-only
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let t = TimesTable(multiplier: 20)

//t[22] = 999 fails becausse TiemsTable is get-only

struct Matrix{
    let rows: Int
    let cols: Int
    var grid: [Double]
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        grid = Array(repeating: 0.0, count: rows * cols)
    }
    
    func indexIsValid(row: Int, col: Int) -> Bool {
        return row < rows && col < cols && row > 0 && col > 0
    }
    
    subscript(row: Int, col: Int) -> Double{
        get{
            assert(indexIsValid(row: row, col: col), "Index out of range")
            return grid[row*cols + col]
        }
        
        set{
            assert(indexIsValid(row: row, col: col), "Index out of range")
            grid[row*cols + col] = newValue
        }
    }
}


// Matrix in 2d array
var m = [[Int]]()
for _ in 0..<3{
    m.append([1,1,1,1])
}

m
m[1][1] = 10001
m


// Martix in subscrips

var matrix = Matrix(rows: 10, cols: 20)
matrix[8,12]
matrix[8,12] = 100
matrix[8,12]


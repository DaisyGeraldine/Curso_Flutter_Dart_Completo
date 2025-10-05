// ListView
ListView.builder(
  itemCount: tareas.length,
  itemBuilder: (_, i) => Text(tareas[i]),
)

// GridView
GridView.count(
  crossAxisCount: 2,
  children: [Image.asset('img1.png'), Image.asset('img2.png')],
)

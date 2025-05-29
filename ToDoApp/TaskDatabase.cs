using SQLite;
using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoApp.Models;
using System.IO;
using Xamarin.Essentials;

namespace ToDoApp.Services
{
    public class TaskDatabase
    {
        private readonly SQLiteAsyncConnection _database;

        public TaskDatabase()
        {
            var dbPath = Path.Combine(FileSystem.AppDataDirectory, "Tasks.db3");
            _database = new SQLiteAsyncConnection(dbPath);
            _database.CreateTableAsync<TaskItem>().Wait();
        }

        public Task<List<TaskItem>> GetTasksAsync() => _database.Table<TaskItem>().ToListAsync();
        public Task<int> SaveTaskAsync(TaskItem task) => task.Id != 0 ?
                _database.UpdateAsync(task) : _database.InsertAsync(task);
        public Task<int> DeleteTaskAsync(TaskItem task) => _database.DeleteAsync(task);
    }
}

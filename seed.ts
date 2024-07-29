import { sqliteDatabase as db } from "./dbConnect";

import fs from 'fs';
import path from 'path';

function readSQLFile(filePath: string): string {
  return fs.readFileSync(path.resolve(__dirname, filePath), 'utf8');
}

function readSQLFilesFromDirectory(directoryPath: string): string[] {
  const files = fs.readdirSync(directoryPath);
  return files.filter(file => file.endsWith('.sql')).map(file => path.join(directoryPath, file));
}

async function isDatabaseSeeded(db: any): Promise<boolean> {
  const stmt = db.prepare("SELECT name FROM sqlite_master WHERE type='table' LIMIT 1");
  const row = stmt.get();
  if(!row){
    return false;
  } 
  const anyEntry =  db.prepare(`SELECT * FROM ${row.name} LIMIT 1`).get();
  return !!anyEntry;
}

async function seedDatabase(db: any, sqlFilePath: string): Promise<void> {
  const sqlQueries = readSQLFile(sqlFilePath);
  await db.exec(sqlQueries);
}


(async () => {
  try {
    const seeded = await isDatabaseSeeded(db);
    if (!seeded) {
      console.log("Database is not seeded. Seeding now...");
      
      const sqlFiles = readSQLFilesFromDirectory('./seedsFiles');
      for (const sqlFile of sqlFiles) {
        console.log(`Seeding file: ${sqlFile}`);
        await seedDatabase(db, sqlFile);
      }
      
      console.log("Database seeded successfully.");
    } else {
      console.log("Database is already seeded.");
    }
  } catch (err) {
    console.error("Error seeding database:", err);
  }
})();